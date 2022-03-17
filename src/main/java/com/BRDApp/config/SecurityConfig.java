//package com.BRDApp.config;
//
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.User.UserBuilder;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//
//	@Override
//	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//
//		// add our users for in memory authentication
//
//		UserBuilder users = User.withDefaultPasswordEncoder();
//
//		auth.inMemoryAuthentication()
//			.withUser(users.username("ankit").password("ankit@12345").roles("maker"))
//			.withUser(users.username("anmol").password("anmol@12345").roles("checker"))
//			.withUser(users.username("apurv").password("apurv@12345").roles("maker"))
//			.withUser(users.username("bhartendu").password("bhartendu@12345").roles("checker"));
//	}


//	override from WebSecurityConfigurerAdapter

//	@Override
//	protected void configure(HttpSecurity http) throws Exception {
//
//		http.authorizeRequests()
//				.antMatchers("/resources/**").permitAll()
//				.anyRequest().authenticated()
//				.and()
//				.formLogin()
//				.loginPage("/loginForm")
//				.loginProcessingUrl("/authenticateTheUser")
//				.permitAll();
//	}
//}






