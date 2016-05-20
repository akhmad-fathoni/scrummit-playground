package com.mitrais.scrummit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mitrais.scrummit.bo.project.ProjectBO;
import com.mitrais.scrummit.model.project.Project;

@RestController
@RequestMapping("/project")
public class ProjectRestController {
    @Autowired
    private ProjectBO           projectBO;

    private static final String template = "You get project:  %s!";

    @RequestMapping(path = "/list", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Project> listAllProject() {
        List<Project> projects = projectBO.listAllProject();
        return projects;
    }

    @RequestMapping(path = "/get/{id}", method = RequestMethod.GET)
    public @ResponseBody Project getProject(@PathVariable("id") String id) {
        return projectBO.getProject(id);
    }

    @RequestMapping(path = "/projectname", method = RequestMethod.GET)
    public @ResponseBody List<Project> getByProjectName(@RequestParam(value = "projectname") String projectname) {

        return projectBO.getProjectByName(projectname);

    }

    @RequestMapping(path = "/createdBy/{id}", method = RequestMethod.GET)
    public @ResponseBody List<Project> getByProjectCreatedBy(@PathVariable("id") String id) {

        return projectBO.getProjectCreatedBy(id);

    }

    @RequestMapping(path = "/", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public Project create(@RequestBody Project project) {
        return projectBO.createProject(project);
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public Project delete(@PathVariable("id") String id) {
        return projectBO.deleteProject(id);
    }
}