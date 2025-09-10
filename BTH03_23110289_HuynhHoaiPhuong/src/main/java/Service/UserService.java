package Service;

import Models.User;

public interface UserService {
    User login(String username, String password);
    boolean register(String username, String password, String fullname, String sdt);
    boolean verifyUserForReset(String username, String fullname, String sdt);
    boolean resetPassword(String username, String newPassword);
}
