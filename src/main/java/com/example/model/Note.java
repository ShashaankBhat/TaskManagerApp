package com.example.model;

import java.sql.Timestamp;

public class Note {
	 private int id;
	    private String content;
	    private Timestamp createdAt;

	    public Note(int id, String content, Timestamp createdAt) {
	        this.id = id;
	        this.content = content;
	        this.createdAt = createdAt;
	    }

	    // Getters for accessing the fields
	    public int getId() {
	        return id;
	    }

	    public String getContent() {
	        return content;
	    }

	    public Timestamp getCreatedAt() {
	        return createdAt;
	    }
}

