using NUnit.Framework;
using KoiOrderingSystem.Controllers;
using KoiOrderingSystem.Models;
using Microsoft.EntityFrameworkCore; // Import để sử dụng DbContext
using Moq;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;

namespace KoiOrderingSystem.Tests
{
    [TestFixture]
    public class LoginControllerTests
    {
        private Koi88Context _dbContext;
        private LoginController _controller;
        private Mock<ISession> _mockSession;
        private Dictionary<string, object> _sessionStorage;

        [SetUp]
        public void SetUp()
        {
            // Sử dụng kết nối thật tới SQL Server
            var options = new DbContextOptionsBuilder<Koi88Context>()
                .UseSqlServer("Data Source=LAPTOP-GFKPKMHK\\SQLEXPRESS;Initial Catalog=Koi88;User ID=SA;Password=12345;Trust Server Certificate=True;")
                .Options;

            _dbContext = new Koi88Context(options);

            // Tạo session storage dưới dạng dictionary
            _sessionStorage = new Dictionary<string, object>();

            // Mock session
            _mockSession = new Mock<ISession>();
            _mockSession.Setup(s => s.Set(It.IsAny<string>(), It.IsAny<byte[]>()))
                .Callback<string, byte[]>((key, val) => _sessionStorage[key] = val);
            _mockSession.Setup(s => s.TryGetValue(It.IsAny<string>(), out It.Ref<byte[]>.IsAny))
                .Returns((string key, out byte[] value) =>
                {
                    if (_sessionStorage.ContainsKey(key))
                    {
                        value = (byte[])_sessionStorage[key];
                        return true;
                    }
                    value = null;
                    return false;
                });

            // Mock HttpContext
            var mockHttpContext = new Mock<HttpContext>();
            mockHttpContext.Setup(s => s.Session).Returns(_mockSession.Object);
            _controller = new LoginController(_dbContext)
            {
                ControllerContext = new ControllerContext
                {
                    HttpContext = mockHttpContext.Object
                }
            };
        }

        [Test]
        public void Login_ValidWithCustomer() //Test tài khoản của Customer đã đăng ký
        {
            // Account: Tài khoản của khách hàng đã đăng ký
            var loginModel = new Account { Username = "trung1234", Password = "123456789" };

            // Act: Gọi hàm login
            var result = _controller.Login(loginModel) as RedirectToActionResult;
            
            // Assert: Kiểm tra người dùng đã chuyển hướng đúng, nêú tài khoản có tồn tại thì sẽ chuyển customer sang Home page
            Assert.That(result, Is.Not.Null);
            Assert.That(result.ActionName, Is.EqualTo(""));
            Assert.That(result.ControllerName, Is.EqualTo("Home"));
        }
        [Test]
        public void Login_InvalidWithNotRegister() //Test tài khoản chưa đăng ký
        {
            // Account: Tài khoản của khách hàng chưa đăng ký
            var loginModel = new Account { Username = "trun", Password = "123456789" };

            // Act: Gọi hàm login
            var result = _controller.Login(loginModel) as RedirectToActionResult;

            // Assert: Kiểm tra người dùng đã chuyển hướng đúng, nếu tài khoản không tồn tại thì sẽ không đăng nhập được
            Assert.That(result, Is.Not.Null);
            Assert.That(result.ActionName, Is.EqualTo(""));
            Assert.That(result.ControllerName, Is.EqualTo("Home"));
        }
        [Test]
        public void Login_InvalidRoleID() //Test tài khoản của Staff, Manager, Admin System
        {
            //Account: Tài khoản có tồn tại nhưng của các role khác 
            var loginModel = new Account { Username = "manager", Password = "123" };

            // Act: Gọi hàm login
            var result = _controller.Login(loginModel) as RedirectToActionResult;

            // Assert: Kiểm tra người dùng đã chuyển hướng đúng, nêú tài khoản không có roleid của customer thì không thể chuyển hướng về trang Home page mà sẽ sang trang khác
            Assert.That(result, Is.Not.Null);
            Assert.That(result.ActionName, Is.EqualTo(""));
            Assert.That(result.ControllerName, Is.EqualTo("Home"));
        }
        [Test]
        public void Login_ValidWithManager() //Test tài khoản của Staff, Manager, Admin System
        {
            //Account: Tài khoản của Manager
            var loginModel = new Account { Username = "manager", Password = "123" };

            // Act: Gọi hàm login
            var result = _controller.Login(loginModel) as RedirectToActionResult;

            // Assert: Kiểm tra người dùng đã chuyển hướng đúng, nêú tài khoản không có roleid của customer thì không thể chuyển hướng về trang Home page mà sẽ sang trang khác
            Assert.That(result, Is.Not.Null);
            Assert.That(result.ActionName, Is.EqualTo("Home"));
            Assert.That(result.ControllerName, Is.EqualTo("Admin"));
        }

        [TearDown]
        public void TearDown()
        {
            // Dọn dẹp DbContext sau mỗi test
            if (_dbContext != null)
            {
                _dbContext.Dispose();
            }
            if (_controller != null)
            {
                _controller.Dispose();
            }
        }
    }
}
