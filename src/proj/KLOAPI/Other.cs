using System;
using System.Collections.Generic;
using System.Text;

namespace KLOAPI
{
    /*public class Other
    {
    }*/

    /// <summary>
    /// Unsigned short length coordinate structure
    /// </summary>
    public class XYU16
    {
        public ushort x, y;
        public XYU16()
        {
            x = 0;
            y = 0;
        }
        public XYU16(ushort x, ushort y)
        {
            this.x = x;
            this.x = y;
        }
    }
}