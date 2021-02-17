using System.Collections.Generic;

namespace KLOAPI
{
    public enum ObjectType
    {
        Item,
        Entity,
        Door
    };

    public enum Item
    {
        Gem,
        Diamond,
        Heart,
        Star,
        Life
    };

    public enum Entity
    {
        Moo,
        Moofly,
        Box,
        Ball
    };

    public enum Door
    {
        Goal,
        Locked0,
        Locked1,
        Warp
    };

    public class Object
    {
        public byte type = 0;
        public byte subtype = 0;

        public XYU16 pos = new XYU16(16, 16);
        public byte[] props = new byte[2];

        public Object()
        {
            
        }

        public Object(byte type, byte subtype, byte[] props, XYU16 pos)
        {
            this.type = type;
            this.type = subtype;
            this.props = props;
            this.pos = pos;
        }

        public Object(byte[] input)
        {
            
        }
    }
}
