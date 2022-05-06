using Microsoft.AspNetCore.Mvc;

namespace R.Systems.Tests.Controllers;

[ApiController]
[Route("version")]
public class VersionController : ControllerBase
{
    [HttpGet]
    public IActionResult GetVersion()
    {
        return Ok("1.0.0-preview.3");
    }
}
