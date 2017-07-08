package ecommerce.common;

import ecommerce.database.UserRepository;
import ecommerce.domain.IUserRepository;
import ecommerce.domain.User;
import java.util.ArrayList;
import java.util.Collection;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;

/**
 *
 * @author Ganna
 */
@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

    IUserRepository repository = new UserRepository();

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

        String login = authentication.getName();
        String password = (String) authentication.getCredentials();

        User user = repository.getUserByLogin(login);

        if (user == null || !user.getAccount().getLogin().equalsIgnoreCase(login)) {
            throw new BadCredentialsException("User name not found.");
        }

        if (!password.equals(user.getAccount().getPassword())) {
            throw new BadCredentialsException("Wrong password.");
        }

        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(user.getPermission());

        return new UsernamePasswordAuthenticationToken(user, password, authorities);
    }

    @Override
    public boolean supports(Class<?> arg0) {
        return true;
    }

}
