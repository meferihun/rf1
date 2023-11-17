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


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Override
  protected void configure(HttpSecurity http) throws Exception {
    http
<<<<<<< HEAD
            .authorizeRequests()
            .antMatchers("/edit/*").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
            .anyRequest().permitAll()
            .and()
            .formLogin().loginPage("/login")
            .defaultSuccessUrl("/")
            .permitAll()
            .and()
            .csrf().disable()
            .logout().logoutSuccessUrl("/").permitAll();
=======
      .authorizeRequests()
      .antMatchers("/edit/*").access("hasRole('ROLE_USER') or hasRole('ROLE_ADMIN')")
      .anyRequest().permitAll()
      .and()
      .formLogin().loginPage("/login")
      .defaultSuccessUrl("/")
      .permitAll()
      .and()
      .csrf().disable()
      .logout().logoutSuccessUrl("/").permitAll();
>>>>>>> 565ecc86af76b0cc5b406f0f18702bab0f265a90
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