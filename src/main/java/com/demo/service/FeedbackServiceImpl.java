package com.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.demo.exception.ResourceNotFoundException;
import com.demo.model.Feedback;
import com.demo.repository.FeedbackRepository;

public class FeedbackServiceImpl implements FeedbackService{
	
	@Autowired
	private FeedbackRepository repo;
	
	@Autowired
    public FeedbackServiceImpl(FeedbackRepository repo) {
        this.repo = repo;
    }

	@Override
	public Feedback saveFeedback(Feedback feedback) {
		return repo.save(feedback);
	}

	@Override
	public List<Feedback> getAllFeedback() {
		return repo.findAll();
	}

	@Override
	public Feedback getFeedbackById(Long id) {
		return repo.findById(id)
			    .orElseThrow(() -> new ResourceNotFoundException("Feedback not found with id: " + id));
	}

	@Override
	public void deleteFeedback(Long id) {
		repo.deleteById(id);
	}

}
