using System;
using System.Windows.Forms;

namespace enVisioner
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            //Application.EnableVisualStyles();
            //Application.VisualStyleState = System.Windows.Forms.VisualStyles.VisualStyleState.NoneEnabled;
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new manager());
        }
    }
}
