package com.ankit.repo;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ankit.entity.ContactEntity;

public interface ContactDtlsRepository extends JpaRepository<ContactEntity, Serializable> {

}
