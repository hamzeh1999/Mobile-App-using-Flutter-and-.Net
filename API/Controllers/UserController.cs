using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using API.Models;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly DataContext _context;

        public UserController(DataContext context)
        {
            _context = context;
        }

        // GET: api/User
        [HttpGet]
        public async Task<ActionResult<IEnumerable<User1>>> GetUser1()
        {
          if (_context.User1 == null)
          {
              return NotFound();
          }
            return await _context.User1.ToListAsync();
        }

        // GET: api/User/5
        [HttpGet("{id}")]
        public async Task<ActionResult<User1>> GetUser1(int id)
        {
          if (_context.User1 == null)
          {
              return NotFound();
          }
            var User1 = await _context.User1.FindAsync(id);

            if (User1 == null)
            {
                return NotFound();
            }

            return User1;
        }

        // PUT: api/User/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutUser1(int id, User1 User1)
        {
            if (id != User1.Id)
            {
                return BadRequest();
            }

            _context.Entry(User1).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!User1Exists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/User
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<User1>> PostUser1(User1 User1)
        {
          if (_context.User1 == null)
          {
              return Problem("Entity set 'DataContext.User1'  is null.");
          }
            _context.User1.Add(User1);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetUser1", new { id = User1.Id }, User1);
        }

        // DELETE: api/User/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteUser1(int id)
        {
            if (_context.User1 == null)
            {
                return NotFound();
            }
            var User1 = await _context.User1.FindAsync(id);
            if (User1 == null)
            {
                return NotFound();
            }

            _context.User1.Remove(User1);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool User1Exists(int id)
        {
            return (_context.User1?.Any(e => e.Id == id)).GetValueOrDefault();
        }
    }
}
