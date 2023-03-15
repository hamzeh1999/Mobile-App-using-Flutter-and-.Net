using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace API.Models
{
    public class User1
    {
        [Key]
         public int Id { get; set; }
         public string Email { get; set; }

         public string Passwordd { get; set; }
    }
}