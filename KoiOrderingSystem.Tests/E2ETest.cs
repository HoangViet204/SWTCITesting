using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using System;
using OpenQA.Selenium.Support.UI;

namespace KoiOrderingSystem.Tests
{
    public class LoginEndToEndTests
    {
        private IWebDriver _driver;

        [SetUp]
        public void Setup()
        {
            // Khởi động ChromeDriver
            _driver = new ChromeDriver();
            _driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
        }

        [Test]
        public void Login_ValidCredentials_RedirectsToHome()
        {
            // Điều hướng tới trang đăng nhập
            _driver.Navigate().GoToUrl("https://localhost:7234/Login");

            // Tìm trường Username và nhập giá trị
            var usernameField = _driver.FindElement(By.Name("Username"));
            usernameField.SendKeys("trung1234");

            // Tìm trường Password và nhập giá trị
            var passwordField = _driver.FindElement(By.Name("Password"));
            passwordField.SendKeys("123456789");

            // Tìm nút submit và nhấn
            var loginButton = _driver.FindElement(By.CssSelector("input[type='submit'][value='Login']"));
            loginButton.Click();
            System.Threading.Thread.Sleep(5000);

            // Kiểm tra nếu URL sau khi đăng nhập là trang chủ
            Assert.IsTrue(_driver.Url.Contains("https://localhost:7234"), "Người dùng không được chuyển hướng đến trang chủ sau khi đăng nhập thành công.");
        }



        [Test]
        public void Login_ValidCredentials_RedirectsToAdminHome()
        {
            // Điều hướng tới trang đăng nhập
            _driver.Navigate().GoToUrl("https://localhost:7234/Login");

            // Tìm trường Username và nhập giá trị
            var usernameField = _driver.FindElement(By.Name("Username"));
            usernameField.SendKeys("manager");

            // Tìm trường Password và nhập giá trị
            var passwordField = _driver.FindElement(By.Name("Password"));
            passwordField.SendKeys("123");

            // Tìm nút submit và nhấn
            var loginButton = _driver.FindElement(By.CssSelector("input[type='submit'][value='Login']"));
            loginButton.Click();
            System.Threading.Thread.Sleep(5000);

            // Kiểm tra nếu URL sau khi đăng nhập là trang chủ
            Assert.IsTrue(_driver.Url.Contains("https://localhost:7234/Admin/Home"), "Người dùng không được chuyển hướng đến trang chủ sau khi đăng nhập thành công.");

            var dropdownTrigger = _driver.FindElement(By.CssSelector("a.nav-link.dropdown-toggle"));
            dropdownTrigger.Click();

            System.Threading.Thread.Sleep(5000);


            // Find and click the logout button (adjusted with correct href)
            var logoutButton = _driver.FindElement(By.CssSelector("a.dropdown-item[href='/Login/Logout']"));
            logoutButton.Click();


            Assert.IsTrue(_driver.Url.Equals("https://localhost:7234/"), "User was not redirected to the base URL after logging out.");
        }

        [Test]
        public void Register_Login_Logout()
        {
            // Navigate to the login page
            _driver.Navigate().GoToUrl("https://localhost:7234/Login");

            // Click the "Create new account" link
            var createAccountLink = _driver.FindElement(By.CssSelector("a[href='/Register']"));
            createAccountLink.Click();

            // Fill in the registration form
            var usernameField = _driver.FindElement(By.Name("Username"));
            usernameField.SendKeys("Hvdepzai");
            System.Threading.Thread.Sleep(3000);

            var passwordField = _driver.FindElement(By.Name("Password"));
            passwordField.SendKeys("12345678");
            System.Threading.Thread.Sleep(3000);

            var confirmPasswordField = _driver.FindElement(By.Id("ConfirmPassword"));
            confirmPasswordField.SendKeys("12345678");
            System.Threading.Thread.Sleep(1000);

            var emailField = _driver.FindElement(By.Name("Email"));
            emailField.SendKeys("viet@gmail.com");
            System.Threading.Thread.Sleep(1000);

            var firstNameField = _driver.FindElement(By.Name("Firstname"));
            firstNameField.SendKeys("John");
            System.Threading.Thread.Sleep(1000);

            var lastNameField = _driver.FindElement(By.Name("Lastname"));
            lastNameField.SendKeys("Doe");
            System.Threading.Thread.Sleep(1000);

            var phoneField = _driver.FindElement(By.Name("Phone"));
            phoneField.SendKeys("0123456789");
            System.Threading.Thread.Sleep(1000);


            // Click the Register button
            var registerButton = _driver.FindElement(By.CssSelector("input[type='submit'][value='Register']"));
            registerButton.Click();
            System.Threading.Thread.Sleep(1000);

            // Wait for the success message to appear
            var wait = new WebDriverWait(_driver, TimeSpan.FromSeconds(10));
            wait.Until(d => d.SwitchTo().Alert());

            // Switch to the alert
            var alert = _driver.SwitchTo().Alert();

            // Click the OK button in the alert
            alert.Accept(); // This will close the aler

            System.Threading.Thread.Sleep(1000);

            // Check if the user is redirected back to the login page
            Assert.IsTrue(_driver.Url.Equals("https://localhost:7234/Login"), "User was not redirected to the login page after registration.");


            var loginUsernameField = _driver.FindElement(By.Name("Username"));
            loginUsernameField.SendKeys("Hvdepzai");
            System.Threading.Thread.Sleep(1000);

            var loginPasswordField = _driver.FindElement(By.Name("Password"));
            loginPasswordField.SendKeys("12345678");
            System.Threading.Thread.Sleep(1000);

            var loginButton = _driver.FindElement(By.CssSelector("input[type='submit'][value='Login']"));
            loginButton.Click();
            System.Threading.Thread.Sleep(1000);

            // Step 7: Verify redirection to home page
            Assert.IsTrue(_driver.Url.Equals("https://localhost:7234/"), "User was not redirected to the homepage after logging in.");
            System.Threading.Thread.Sleep(1000);

            // Step 8: Click the user dropdown to log out
            var dropdownTrigger = _driver.FindElement(By.CssSelector("a.nav-link.dropdown-toggle.user-profile"));
            dropdownTrigger.Click();
            System.Threading.Thread.Sleep(1000);
            // Step 9: Click the logout button
            var logoutButton = _driver.FindElement(By.CssSelector("a.dropdown-item[href='/Login/Logout']"));
            logoutButton.Click();
            System.Threading.Thread.Sleep(1000);
            // Step 10: Verify redirection back to login page
            Assert.IsTrue(_driver.Url.Equals("https://localhost:7234/"), "User was not redirected to the login page after logging out.");
        }


        [TearDown]
        public void Teardown()
        {
            // Đóng và giải phóng tài nguyên của driver
            if (_driver != null)
            {
                _driver.Quit();
                _driver.Dispose();  // Giải phóng tài nguyên của driver
            }
        }

        // Gọi Dispose theo pattern của IDisposable
        public void Dispose()
        {
            if (_driver != null)
            {
                _driver.Quit();
                _driver.Dispose();
            }
        }
    }
}
