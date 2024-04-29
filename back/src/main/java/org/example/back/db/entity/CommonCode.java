package org.example.back.db.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "common_code")
public class CommonCode {
	@Id
	@Column(name = "code", nullable = false)
	private Integer id;

	@Column(name = "name", nullable = false, length = 20)
	private String name;

}