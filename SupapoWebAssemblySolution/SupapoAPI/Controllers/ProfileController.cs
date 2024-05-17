using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SupapoAPI.dataContext;
using SupapoClassLib.Model;

namespace SupapoAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        private DataContext context;
        public ProfileController(DataContext _context) 
        {
        context= _context;
        }
        [HttpGet("Get/{Id}")]
        public async Task<IActionResult> GetProfile(string Id)
        {
            var con = await context.GetProfile(Id);
            return Ok(con);
        }
        [HttpPost("AddProfile")]
        public async Task<IActionResult> AddProfile([FromBody] Profile profile)
        {
            await context.AddProfile(profile);
            return Ok();
        }
        [HttpPatch("Update/{Id}")]
        public async Task<IActionResult> UpdateProfile(string Id, [FromBody] Profile profile)
        {
            profile.Id = Id;
            await context.UpdateProfile(profile);
            return Ok();
        }
        [HttpDelete("Delete/{Id}")]
        public async Task<IActionResult> DeleteProfile(string Id)
        {
            await context.DeleteProfile(Id);
            return Ok();
        }
    }
}
