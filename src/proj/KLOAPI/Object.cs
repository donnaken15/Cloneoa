using System.Collections.Generic;

namespace KLOAPI
{
    public class Object
    {
        public List<byte> data;

        public XYU16 pos;

        public Object()
        {
            data = new List<byte>(8);
        }

        public Object(byte[] input)
        {
            data = new List<byte>(input);
        }
    }
}
