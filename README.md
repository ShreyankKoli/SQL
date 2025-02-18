Task AddUserAsync(User user);
Task<List<User>> GetAllUsersAsync();

service
public async Task AddUserAsync(User user)
    {
        await _context.Users.AddAsync(user);
        await _context.SaveChangesAsync();
    }
    public async Task<List<User>> GetAllUsersAsync()
    {
        return await _context.Users.ToListAsync();
    }

 manager   
public async Task<List<User>> AddUserAsync(UserDetailsDTO userDetailsDTO)
    {
        var user = new User
        {
            UserId = userDetailsDTO.UserId,
            FirstName = userDetailsDTO.FirstName,
            LastName = userDetailsDTO.LastName,
            Age = userDetailsDTO.Age,
            UserName = userDetailsDTO.UserName,
            Password = userDetailsDTO.Password, // Consider hashing for security
            UserDetails = new List<UserDetail>
            {
                new UserDetail
                {
                    Address = userDetailsDTO.Address,
                    Email = userDetailsDTO.Email,
                    Phone = userDetailsDTO.Phone,
                    Height = userDetailsDTO.Height,
                    Weight = userDetailsDTO.Weight
                }
            }
        };

        await _userRepository.AddUserAsync(user);
        return await _userRepository.GetAllUsersAsync();
    }

    
    [HttpPost("PostAllUser")]
    public async Task<IActionResult> PostAllUser([FromForm] UserDetailsDTO userDetailsDTO)
    {
        var users = await _userManager.AddUserAsync(userDetailsDTO);
        return Ok(users);
    }

    edit
    Task<User?> GetUserByIdAsync(int userId);
    Task UpdateUserAsync(User user);

    service
    public async Task<User?> GetUserByIdAsync(int userId)
    {
        return await _context.Users.Include(u => u.UserDetails)
                                   .FirstOrDefaultAsync(u => u.UserId == userId);
    }

    public async Task UpdateUserAsync(User user)
    {
        _context.Users.Update(user);
        await _context.SaveChangesAsync();
    }

manager
public async Task<User?> UpdateUserAsync(int userId, UserDetailsDTO userDetailsDTO)
    {
        var user = await _userRepository.GetUserByIdAsync(userId);
        if (user == null)
            return null;

        user.FirstName = userDetailsDTO.FirstName;
        user.LastName = userDetailsDTO.LastName;
        user.Age = userDetailsDTO.Age;
        user.UserName = userDetailsDTO.UserName;
        user.Password = userDetailsDTO.Password; // Consider hashing

        if (user.UserDetails != null && user.UserDetails.Count > 0)
        {
            var userDetail = user.UserDetails[0];
            userDetail.Address = userDetailsDTO.Address;
            userDetail.Email = userDetailsDTO.Email;
            userDetail.Phone = userDetailsDTO.Phone;
            userDetail.Height = userDetailsDTO.Height;
            userDetail.Weight = userDetailsDTO.Weight;
        }

        await _userRepository.UpdateUserAsync(user);
        return user;
    }

        [HttpPut("EditUser/{userId}")]
    public async Task<IActionResult> EditUser(int userId, [FromForm] UserDetailsDTO userDetailsDTO)
    {
        var updatedUser = await _userManager.UpdateUserAsync(userId, userDetailsDTO);
        if (updatedUser == null)
        {
            return NotFound("User not found.");
        }
        return Ok(new { Message = "User updated successfully", User = updatedUser });
    }
