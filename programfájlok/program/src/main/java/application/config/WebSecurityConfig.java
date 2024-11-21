package application.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import application.service.CustomUserDetailsService;
import org.springframework.security.web.context.NullSecurityContextRepository;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
            .authorizeRequests()
            .antMatchers("/edit/*").access("hasRole('ROLE_USER') or hasRole('ROLE_EDITOR') or hasRole('ROLE_ADMIN')")
            .antMatchers("/szerkesztes/*").access("hasRole('ROLE_USER') or hasRole('ROLE_EDITOR') or  hasRole('ROLE_ADMIN')")
            .antMatchers("/torles/*").access("hasRole('ROLE_USER') or hasRole('ROLE_EDITOR') or hasRole('ROLE_ADMIN')")
            .antMatchers("/profil/style.css").permitAll()
            .anyRequest().permitAll()
            .and()
            .formLogin().loginPage("/login").failureUrl("/login?error=true")
            .defaultSuccessUrl("/")
            .permitAll()
            .and()
            .csrf().disable()
            .logout().logoutSuccessUrl("/").permitAll();
  }

  @Autowired
  protected void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {}

  @Bean
  public BCryptPasswordEncoder passwordEncoder() {
    return new BCryptPasswordEncoder();
  }

  @Bean
  public UserDetailsService userDetailsService() {
    return new CustomUserDetailsService();
  }

}