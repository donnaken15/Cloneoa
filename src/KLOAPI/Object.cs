using System.Collections.Generic;

namespace KLOAPI
{
    public class Object
    {
        public List<byte> data;

        public Object()
        {
            data = new List<byte>(10);
        }

        public Object(byte[] input)
        {
            data = new List<byte>(input);
        }
    }
}
