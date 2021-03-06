package com.piisw.cinema_tickets_app.domain.user.control;

import com.piisw.cinema_tickets_app.infrastructure.security.UserRole;
import com.piisw.cinema_tickets_app.domain.auditedobject.entity.ObjectState;
import com.piisw.cinema_tickets_app.domain.user.entity.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.text.MessageFormat;
import java.util.List;
import java.util.regex.Pattern;

@Service
@Transactional
@RequiredArgsConstructor
public class UserService {

    public static final String USERNAME_ALREADY_TAKEN_MSG = "User with username {0} already exists!";
    public static final String EMAIL_ALREADY_TAKEN_MSG = "User with email {0} already exists!";
    private static final String NO_SUCH_USER = "There is no user with id {0}";
    public static final String PASSWORD_NOT_PASSED_VALIDATION_RULES = "Password not passed validation rules";
    private static final Pattern EMAIL_REGEX = Pattern.compile("[^@ ]+@[^@ ]+\\.[^@ ]+");
    public static final String EMAIL_INCORRECT = "Supplied email is incorrect";

    @Value("${root.name}")
    private String rootUserName;

    @Value("${root.password}")
    private String rootUserPassowrd;

    private final PasswordEncoder passwordEncoder;
    private final UserRepository userRepository;

    public UserEntity registerUser(UserEntity newUser) {
        validateUsernameUniqueness(newUser);
        validateEmailCorrectness(newUser.getEmail());
        validateEmailUniqueness(newUser.getEmail());
        validatePasswordRules(newUser.getPassword());

        newUser.setPassword(passwordEncoder.encode(newUser.getPassword()));
        return userRepository.save(newUser);
    }

    private void validateUsernameUniqueness(UserEntity user) {
        if(userRepository.existsByUsername(user.getUsername())) {
            throw new IllegalArgumentException(MessageFormat.format(USERNAME_ALREADY_TAKEN_MSG, user.getUsername()));
        }
    }

    private void validateEmailUniqueness(String email) {
        if(userRepository.existsByEmail(email)) {
            throw new IllegalArgumentException(MessageFormat.format(EMAIL_ALREADY_TAKEN_MSG, email));
        }
    }

    private void validateEmailCorrectness(String email) {
        if (!EMAIL_REGEX.matcher(email).matches()) {
            throw new IllegalArgumentException(EMAIL_INCORRECT);
        }
    }

    private void validatePasswordRules(String password) {
        if (password.length() < 8) {
            throw new IllegalArgumentException(PASSWORD_NOT_PASSED_VALIDATION_RULES);
        }
    }

    public UserEntity getExistingUser(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new IllegalArgumentException(MessageFormat.format(NO_SUCH_USER, userId)));
    }

    public boolean isExistingAndActiveUser(Long id) {
        return userRepository.existsByIdAndAndObjectState(id, ObjectState.ACTIVE);
    }

    public List<UserEntity> getUsersFromDatabase(List<Long> usersId){
        return userRepository.findAllById(usersId);
    }

    public boolean userExistsByUsername(String username) {
        return userRepository.existsByUsername(username);
    }

    public boolean userExistsByEmail(String email) {
        return userRepository.existsByEmail(email);
    }

    public void setNewPassword(UserEntity user, String newPassword) {
        validatePasswordRules(newPassword);
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }

    public void setNewEmail(UserEntity user, String email) {
        validateEmailCorrectness(email);
        validateEmailUniqueness(email);
        user.setEmail(email);
        userRepository.save(user);
    }

    public void setNewPhoneNumber(UserEntity user, String phoneNumber) {
        user.setPhoneNumber(phoneNumber);
        userRepository.save(user);
    }

    @PostConstruct
    public void createRootUser() {
        if (!userExistsByUsername(rootUserName)) {
            registerUser(getRootUser());
        }
    }

    private UserEntity getRootUser() {
        return UserEntity.builder()
                .name(rootUserName)
                .surname(rootUserName)
                .username(rootUserName)
                .userRole(UserRole.ROLE_ADMIN)
                .phoneNumber("111-111-111")
                .email("email@email.com")
                .password(rootUserPassowrd)
                .build();
    }
}
