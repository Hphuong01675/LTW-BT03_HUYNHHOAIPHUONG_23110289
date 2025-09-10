package Service;

import Models.Category;
import java.util.List;

public interface CategoryService {
    boolean addCategory(Category c);
    boolean updateCategory(Category c, int userid, String roleName);
    boolean deleteCategory(int id, int userid, String roleName);
    Category getCategoryById(int id);
    List<Category> getAllCategories();
    List<Category> getCategoriesForHome(int roleid, int userid);

}
