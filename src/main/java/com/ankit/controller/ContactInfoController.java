package com.ankit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ankit.model.Contact;
import com.ankit.service.ContactService;

@Controller
public class ContactInfoController {

	@Autowired
	private ContactService contactService;
	 
	private static final Logger logger = LoggerFactory.getLogger(ContactInfoController.class);


	@GetMapping(value = { "/", "/addContact" })
	public String loadForm(Model model) {
		Contact c = new Contact();
		model.addAttribute("contact", c);
		return "contactInfo";
	}

	@PostMapping(value = "/saveContact")
	public String handleSubmitBtn(@ModelAttribute("contact") Contact c, Model model) {
		logger.info("Phone Contact saved :: " + c);
		boolean isSaved = contactService.saveContact(c);
		if (isSaved) {
			model.addAttribute("succMsg", "Contact Saved");
		} else {
			model.addAttribute("errMsg", "Failed To Save Contact");
		}
		return "contactInfo";

	}

	@GetMapping("/viewContact")
	public String handleViewContactsLink(Model model) {
		List<Contact> contactsList = contactService.getAllContacts();
		model.addAttribute("contacts", contactsList);
		return "viewContact";
	}
	
	
	
}
