package com.momolearn.model;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.momolearn.model.entity.Teachers;

@Repository
public interface TeachersRepository extends JpaRepository<Teachers, Integer>{

}
