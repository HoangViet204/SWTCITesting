using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using NUnit.Framework;
using OpenQA.Selenium.Support.UI;

namespace KoiOrderingSystem.Tests
{
    public class MobileTests
    {
        private IWebDriver _driver;

        [SetUp]
        public void SetUp()
        {
            // Cấu hình ChromeOptions cho trình duyệt di động
            var options = new ChromeOptions();
            options.AddArgument("--no-sandbox");
            options.AddArgument("--disable-dev-shm-usage");
            options.AddArgument("--window-size=430,932"); // Kích thước tương đối cho màn hình iPhone 13 Pro Max
            options.AddArgument("--user-agent=Mozilla/5.0 (iPhone; CPU iPhone OS 15_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Mobile/15E148 Safari/604.1");

            // Khởi tạo ChromeDriver
            _driver = new ChromeDriver(options);
        }

        [Test]
        public void TestLogin()
        {
            // Điều hướng đến trang đăng nhập
            _driver.Navigate().GoToUrl("https://localhost:7234/Login");

            // Tìm trường Username và nhập giá trị
            var usernameField = _driver.FindElement(By.Name("Username")); // Thay đổi tên cho phù hợp
            usernameField.SendKeys("manager");
            // Tìm trường Password và nhập giá trị
            var passwordField = _driver.FindElement(By.Name("Password")); // Thay đổi tên cho phù hợp
            passwordField.SendKeys("123");
            // Tìm nút đăng nhập và nhấn
            var loginButton = _driver.FindElement(By.CssSelector("input[type='submit'][value='Login']"));
            loginButton.Click();
            System.Threading.Thread.Sleep(2000000000);
            // Kiểm tra xem có chuyển hướng đến trang chính không
            Assert.IsTrue(_driver.Url.Contains("https://localhost:7234/Admin/Home"), "Người dùng không được chuyển hướng đến trang chủ sau khi đăng nhập thành công.");
        }

        [TearDown]
        public void TearDown()
        {
            // Giải phóng tài nguyên
            if (_driver != null)
            {
                _driver.Quit(); // Đảm bảo rằng driver được đóng
                _driver.Dispose(); // Giải phóng tài nguyên
            }
        }
    }
}