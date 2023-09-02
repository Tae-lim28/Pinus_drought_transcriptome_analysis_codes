using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Diagnostics;

namespace newNrcdsFasta
{
    internal class NrcdsFasta
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Enter the TRINITY fasta file's location and name:");
            string triniryFastatName = Console.ReadLine();

            Console.WriteLine("Enter the TransDecoder pep cd-hit file's location and name:");
            string transDecoderPepCdHittName = Console.ReadLine();

            Console.WriteLine("Enter the output fasta file's location and name:");
            string outputName = Console.ReadLine();

            Console.WriteLine("Enter the redundant peptide header file's location and name:");
            string redundantOutputName = Console.ReadLine();
            Console.WriteLine();

            Stopwatch stopWatch = new Stopwatch();
            stopWatch.Start();

            StreamReader trinityFile = new StreamReader(triniryFastatName);
            int triniryFastaTranscriptsCount = 0;
            while (!trinityFile.EndOfStream)
            {
                trinityFile.ReadLine();
                triniryFastaTranscriptsCount++;
            }
            trinityFile.DiscardBufferedData();
            trinityFile.BaseStream.Position = 0;
            triniryFastaTranscriptsCount = triniryFastaTranscriptsCount / 2;
            Console.WriteLine("Here are " + triniryFastaTranscriptsCount + " transcripts in TRINITY fasta file.");

            List<string> trinityHeaders = new List<string>(triniryFastaTranscriptsCount);
            List<string> trinitySequences = new List<string>(triniryFastaTranscriptsCount);
            for (int row = 0; row < triniryFastaTranscriptsCount; ++row)
            {
                trinityHeaders.Add(trinityFile.ReadLine());
                trinitySequences.Add(trinityFile.ReadLine());
            }
            trinityFile.Close();

            int firstPosition;
            int secondPositionPlusOne;
            List<string> trinityHeadersForSearch = new List<string>(trinityHeaders.Count);
            for (int header = 0; header < trinityHeaders.Count; ++header)
            {
                firstPosition = trinityHeaders[header].IndexOf("T");
                secondPositionPlusOne = trinityHeaders[header].IndexOf(' ');
                trinityHeadersForSearch.Add(trinityHeaders[header].Substring(firstPosition, secondPositionPlusOne - firstPosition));
            }

            StreamReader transDecoderPepCdHitFile = new StreamReader(transDecoderPepCdHittName);
            int transDecoderPepCdHitHeaderCount = 0;
            while (!transDecoderPepCdHitFile.EndOfStream)
            {
                if (transDecoderPepCdHitFile.Read() == '>')
                {
                    transDecoderPepCdHitHeaderCount++;
                }
            }
            transDecoderPepCdHitFile.DiscardBufferedData();
            transDecoderPepCdHitFile.BaseStream.Position = 0;
            Console.WriteLine("Here are " + transDecoderPepCdHitHeaderCount + " peptides in TransDecoder pep cd-hit file.");

            List<string> cdHitHeaders = new List<string>(transDecoderPepCdHitHeaderCount);
            string temporaryCdHitHeader;
            while (!transDecoderPepCdHitFile.EndOfStream)
            {
                temporaryCdHitHeader = transDecoderPepCdHitFile.ReadLine();
                if (temporaryCdHitHeader.Contains('>'))
                {
                    cdHitHeaders.Add(temporaryCdHitHeader);
                }
            }
            transDecoderPepCdHitFile.Close();

            List<string> cdHitHeadersForSearch = new List<string>(cdHitHeaders.Count);
            for (int header = 0; header < cdHitHeaders.Count; ++header)
            {
                firstPosition = cdHitHeaders[header].IndexOf("T");
                secondPositionPlusOne = cdHitHeaders[header].IndexOf('.');
                cdHitHeadersForSearch.Add(cdHitHeaders[header].Substring(firstPosition, secondPositionPlusOne - firstPosition));
            }

            HashSet<string> writtenStrings = new HashSet<string>(cdHitHeadersForSearch.Count * 2);
            HashSet<string> redundantFastaHeaders = new HashSet<string>(cdHitHeadersForSearch.Count);
            for (int cdHitHeader = 0; cdHitHeader < cdHitHeadersForSearch.Count; ++cdHitHeader)
            {
                for (int trinityHeader = 0; trinityHeader < trinityHeadersForSearch.Count; ++trinityHeader)
                {
                    if (cdHitHeadersForSearch[cdHitHeader] == trinityHeadersForSearch[trinityHeader])
                    {
                        if (writtenStrings.Contains(trinityHeaders[trinityHeader]) == true)
                        {
                            redundantFastaHeaders.Add(trinityHeadersForSearch[trinityHeader]);
                        }
                        else
                        {
                            writtenStrings.Add(trinityHeaders[trinityHeader]);
                            writtenStrings.Add(trinitySequences[trinityHeader]);
                        }

                        break;
                    }
                }
            }

            List<string> redundantPeptideHeaders = new List<string>(cdHitHeadersForSearch.Count);
            for (int cdHitHeader = 0; cdHitHeader < cdHitHeadersForSearch.Count; ++cdHitHeader)
            {
                foreach (string redundantFasta in redundantFastaHeaders)
                {
                    if (redundantFasta == cdHitHeadersForSearch[cdHitHeader])
                    {
                        redundantPeptideHeaders.Add(cdHitHeaders[cdHitHeader]);
                        break;
                    }
                }
            }

            StreamWriter outputFile = new StreamWriter(outputName);
            foreach (string writtenString in writtenStrings)
            {
                outputFile.WriteLine(writtenString);
            }
            outputFile.Close();

            StreamWriter redundantOutputFile = new StreamWriter(redundantOutputName);
            foreach (string redundantPeptideHeader in redundantPeptideHeaders)
            {
                redundantOutputFile.WriteLine(redundantPeptideHeader);
            }
            redundantOutputFile.Close();

            stopWatch.Stop();
            TimeSpan ts = stopWatch.Elapsed;
            string elapsedTime = String.Format("{0:00}:{1:00}:{2:00}.{3:00}",
            ts.Hours, ts.Minutes, ts.Seconds,
            ts.Milliseconds / 10);
            Console.WriteLine("RunTime " + elapsedTime);
        }
    }
}
