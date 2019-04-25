using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace WcfSample
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IEMPNameService" in both code and config file together.
    [ServiceContract]
    public interface IEMPNameService
    {
        [OperationContract]
        User ConvertNameNumberinWords(string name, decimal number);
    }

    [DataContract]
    public class User
    {
        [DataMember]
        public string Name { get; set; }
        [DataMember]
        public string Number { get; set; }
    }
}
