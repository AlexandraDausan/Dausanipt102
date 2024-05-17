#nullable disable
using System;   
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SupapoClassLib.Model
{
     public interface IProfile
    {
        public string Id { get; set; }
        public string PName { get; set; }
        public DateTime BirthDate { get; set; }
        public string PAddress { get; set; }
        public int ContactNumber { get; set; }
        public string CivilStatus { get; set; }
        public string Hobby { get; set; }

    }

    public class Profile : IProfile

    { 
        public string Id { get; set; }
        public string PName { get; set; }
        public DateTime BirthDate { get; set;}
        public string PAddress { get; set; }
        public int ContactNumber { get; set; }
        public string CivilStatus { get; set; }
        public string Hobby { get; set;}

    }

}
