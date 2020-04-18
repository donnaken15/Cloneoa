using System;
namespace KLOAPI
{
    /// <summary>
    /// Credit: David aka dnewmon on CodeProject,
    /// https://www.codeproject.com/Messages/1296018/Re-What-is-the-equivalent-of-LOBYTE-and-HIBYTE-in.aspx
    /// </summary>
    public class ByteAccess
    {
        public static UInt32 MakeLong(UInt16 high, UInt16 low)
        {
            return ((UInt32)low & 0xFFFF) | (((UInt32)high & 0xFFFF) << 16);
        }
        public static UInt16 MakeWord(byte high, byte low)
        {
            return (UInt16)(((UInt32)low & 0xFF) | ((UInt32)high & 0xFF) << 8);
        }
        public static UInt16 LoWord(UInt32 v)
        {
            return (UInt16)(v & 0xFFFF);
        }
        public static UInt16 HiWord(UInt32 v)
        {
            return (UInt16)(v >> 16);
        }
        public static Byte LoByte(UInt16 v)
        {
            return (Byte)(v & 0xFF);
        }
        public static Byte HiByte(UInt16 v)
        {
            return (Byte)(v >> 8);
        }
        public static Byte LoBit(Byte v)
        {
            return (Byte)(v & 0xF);
        }
        public static Byte HiBit(Byte v)
        {
            return (Byte)(v >> 4);
        }
        public static bool Is4Bits(byte v)
        {
            if (v < 16)
                return true;
            else
                throw new InvalidOperationException("Music / Theme ID must have a value less than 16");
        }
    }
}
