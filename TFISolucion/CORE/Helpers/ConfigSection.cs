using System.Configuration;
using System.Runtime.Serialization;

namespace TFI.CORE.Helpers
{
    [DataContract()]
    public class ConfigSection : ConfigurationSection
    {
        [IgnoreDataMember()]
        public static ConfigSection Default
        {
            get { return (ConfigSection)ConfigurationManager.GetSection("ecommerce/core"); }
        }

        [ConfigurationProperty("site")]
        public SiteConfigurationElement Site
        {
            get { return (SiteConfigurationElement)this["site"]; }
            set { this["site"] = value; }
        }

        [DataContract()]
        public class SiteConfigurationElement : ConfigurationElement
        {
            [DataMember()]
            [ConfigurationProperty("cuit", IsRequired = true)]
            public string Cuit
            {
                get { return (string)this["cuit"]; }
                set { this["cuit"] = value; }
            }
        }
    }
}