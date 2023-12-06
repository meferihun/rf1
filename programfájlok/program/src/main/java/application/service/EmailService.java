package application.service;

import application.dao.HirDAO;
import application.dao.UserDAO;
import application.model.Hir;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@EnableScheduling
public class EmailService {
    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private HirDAO hirDAO;

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

    public void sendGoodbyeMessage(String email, String felhasznalonev) {
        SimpleMailMessage message = new SimpleMailMessage();
        message = new SimpleMailMessage();
        message.setFrom(MESSAGE_FROM);
        message.setTo(email);
        message.setSubject("Sikeres fiók törlés");
        message.setText("Kedves " + felhasznalonev + "! \n \n Reméljük hogy minél hamarabb visszatérsz az oldalunkra ! :c");
        javaMailSender.send(message);
    }


    @Scheduled(cron = "10 * * * * *")
    public void hirlevelKuldes(){

        List<String> emailek = userDAO.listEmail();
        String tmp = "";

        for(int i = 0; i < emailek.size(); i++){
            List<String> kategoriak = userDAO.listKategoria(emailek.get(i));
            for(int j = 0; j < kategoriak.size(); j++){
                List<Hir> hirek = hirDAO.listFrissHirek(kategoriak.get(j).toLowerCase());
                tmp += kategoriak.get(j) + "\n\n";
                for(int k = 0; k < hirek.size(); k++){
                    tmp += hirek.get(k).getCim() + " \n";
                }
                tmp += "\n";
            }
            SimpleMailMessage message = new SimpleMailMessage();
            message = new SimpleMailMessage();
            message.setFrom(MESSAGE_FROM);
            message.setTo("hirkereso2@gmail.com");
            //message.setTo(emailek.get(i));
            message.setSubject("Hírlevél");
            message.setText(tmp);
            javaMailSender.send(message);

            tmp = "";
        }

    }
}
