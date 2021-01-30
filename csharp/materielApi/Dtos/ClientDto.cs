using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace materielApi.Dtos
{
    public class ClientDto
    {
        public int? Id { get; set; }
        public string Nom { get; set; }
        public int Type { get; set; }
        public string Telephone { get; set; }
        public int AdresseId { get; set; }

        public ClientDto() { }
        public ClientDto(int? id, string nom, int type, string telephone, int adresseId)
        {
            Id = id;
            Nom = nom;
            Type = type;
            Telephone = telephone;
            AdresseId = adresseId;
        }
    }
}
