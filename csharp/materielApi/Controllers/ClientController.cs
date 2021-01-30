using materielApi.Dtos;
using Microsoft.AspNetCore.Mvc;
using Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace JDRIBAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientController : ControllerBase
    {
        ClientService _clientService;

        public ClientController()
        {
            this._clientService = new Services.ClientService();
        }

        [HttpGet]
        public List<ClientDto> Get()
        {
            return _clientService.FindAll();
        }

        [HttpGet("{id}")]
        public ClientDto Get(int id)
        {
            return _clientService.Find(id);
        }

        [HttpPost]
        public ClientDto Post([FromBody] ClientDto clientDto)
        {
            return _clientService.Create(clientDto);
        }

        [HttpPut("{id}")]
        public ClientDto Put(long id, [FromBody] ClientDto updateClientDTO)
        {
            return _clientService.Update(id, updateClientDTO);
        }

        [HttpDelete("{id}")]
        public int Delete(int id)
        {
            return _clientService.Delete(id);
        }
    }
}
