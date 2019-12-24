using Demo01.Bll;
using Demo01.Model.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace Demo01.Web.Api.Controllers
{
    public class ValuesController : ApiController
    {
        readonly ProductBll product = new ProductBll();  
        // GET api/values
        [HttpGet]
        public List<Product> Get()
        {
            return product.Search();
        }

        // GET api/values/5
        [HttpGet]
        public Product Get(int id)
        {
            return product.Search().FirstOrDefault(x=>x.Id == id);
        }

        // POST api/values
        [HttpPost]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete]
        public bool Delete(int id)
        {
            return product.Del(id);
        }
    }
}
