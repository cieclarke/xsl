using System;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Linq;
using System.Xml.Xsl;

namespace rssTransform
{
    class Program
    {
        static void Main(string[] args)
        {
            string xmlFilePath = args[0];
            string xsltFilePath = args[1];

            XslCompiledTransform t = new XslCompiledTransform();    
            XDocument xml = XDocument.Load(xmlFilePath);
            StringBuilder output = new StringBuilder();

            using (StreamWriter writer = File.CreateText("output.xml"))
            {
                t.Load(xsltFilePath);
                t.Transform(xml.CreateReader(ReaderOptions.None), null ,writer);
            }

            //Console.WriteLine(output.ToString());

            //var result = XDocument.Parse(output.ToString());


            //Console.WriteLine(result.ToString());


        }
    }
}
