using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TFI.DAL
{
    interface IConnection
    {

        DataSet Read(string query, Hashtable data);
        bool Write(string query, Hashtable data);

    }
}
