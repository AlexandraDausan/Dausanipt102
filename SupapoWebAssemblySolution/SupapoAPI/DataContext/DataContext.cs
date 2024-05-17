#nullable disable
using Dapper;
using Microsoft.Data.SqlClient;
using SupapoClassLib.Model;
using System.Data;

namespace SupapoAPI.dataContext
{
    public class DataContext

    {
        protected readonly IConfiguration config;
        protected readonly SqlConnection connection;

        public DataContext(IConfiguration _config) 
        
        {
            config = _config;
            connection = new SqlConnection(config.GetConnectionString("Oliver"));

        }

        public async Task<IProfile> GetProfile(string id)
        {
            var connect = "[dbo].[DisplayProfile]";
            var parameter = new { Id = id };
            var result = await connection.QueryFirstOrDefaultAsync<Profile>(connect, parameter);
            return result;
        }
        public async Task AddProfile(Profile profile)
        {
            var connect = "[dbo].[CreateProfile]";
            var parameter = new DynamicParameters();
            parameter.Add("@Id", profile.Id, DbType.String, ParameterDirection.Input);
            parameter.Add("@PName", profile.PName, DbType.String, ParameterDirection.Input);
            parameter.Add("@BirthDate", profile.BirthDate, DbType.DateTime, ParameterDirection.Input);
            parameter.Add("@PAddress", profile.PAddress, DbType.String, ParameterDirection.Input);
            parameter.Add("@ContactNumber", profile.ContactNumber, DbType.Int32, ParameterDirection.Input);
            parameter.Add("@CivilStatus", profile.CivilStatus, DbType.String, ParameterDirection.Input);
            parameter.Add("@Hobby", profile.Hobby, DbType.String, ParameterDirection.Input);
            await connection.ExecuteAsync(connect, parameter);

        }
        public async Task UpdateProfile(Profile profile)
        {
            var connect = "[dbo].[UpdateProfile]";
            var parameter = new DynamicParameters();
            parameter.Add("@Id", profile.Id, DbType.String, ParameterDirection.Input);
            parameter.Add("@PName", profile.PName, DbType.String, ParameterDirection.Input);
            parameter.Add("@BirthDate", profile.BirthDate, DbType.DateTime, ParameterDirection.Input);
            parameter.Add("@PAddress", profile.PAddress, DbType.String, ParameterDirection.Input);
            parameter.Add("@ContactNumber", profile.ContactNumber, DbType.Int32, ParameterDirection.Input);
            parameter.Add("@CivilStatus", profile.CivilStatus, DbType.String, ParameterDirection.Input);
            parameter.Add("@Hobby", profile.Hobby, DbType.String, ParameterDirection.Input);
            await connection.ExecuteAsync(connect, parameter);

        }
        public async Task DeleteProfile(string id)
        {
            var connect = "[dbo].[DeleteProfile]";
            var parameter = new { Id = id };
            await connection.ExecuteAsync(connect, parameter);
        }

    }
}
