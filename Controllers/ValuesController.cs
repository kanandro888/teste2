using Microsoft.AspNetCore.Mvc;

namespace HelloWorldAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class HelloWorldController : ControllerBase
    {
        // GET: api/helloworld
        [HttpGet]
        public string Get()
        {
            return "Hello World";
        }
    }
}