using Microsoft.AspNetCore.Hosting;
using MoneyTale.Server.Identity.Areas.Identity;

[assembly: HostingStartup(typeof(IdentityHostingStartup))]

namespace MoneyTale.Server.Identity.Areas.Identity
{
    public class IdentityHostingStartup : IHostingStartup
    {
        public void Configure(IWebHostBuilder builder)
        {
            builder.ConfigureServices((_, __) => { });
        }
    }
}
