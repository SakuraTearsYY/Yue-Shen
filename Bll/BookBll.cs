using Dal;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Bll
{
    public class BookBll
    {
        readonly BookDal dal = new BookDal();
        public List<Book> Page(int size, int index, out int count)
        {
            return dal.Page(size, index, out count, x => x.BookID, false);
        }

        public int Count() 
        {
            return dal.Sel().Count();
        }
    }
}
