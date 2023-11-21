package application.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;

    @Value("${spring.mail.username}")
    private String MESSAGE_FROM;
    /*
    * Teszt email:  hirkereso2@gmail.com
     *      jelszó: hirkereso##22
     * */
    public void sendWelcomeMessage(String email, String felhasznalonev) {
        SimpleMailMessage message = new SimpleMailMessage();
        message = new SimpleMailMessage();
        message.setFrom(MESSAGE_FROM);
        message.setTo(email);
        message.setSubject("Sikeres regisztrálás");
        message.setText("Kedves " + felhasznalonev + "! \n \n Köszönjük, hogy regisztráltál az oldalunkra!");
        javaMailSender.send(message);
    }
}
