package org.daisy.pipeline.maven.xproc;

import java.io.File;

import org.apache.maven.plugin.MojoExecutionException;
import com.rackspace.cloud.api.docs.FileUtils;

import java.util.HashMap;
import java.util.Map;

import static org.daisy.pipeline.maven.xproc.utils.asURI;

/**
 * Run an XProc pipeline.
 *
 * @goal olink
 */
public class XProcMojo extends AbstractMojo {
	
	/**
	 * Path to the pipeline
	 *
	 * @parameter default-value="${project.build.directory}/docbkx/cloud/olink/olink.xpl"
	 * @required
	 */
	private File pipeline;

	/**
	 * Build dir.
	 *
	 * @parameter default-value="${project.build.directory}"
	 * @required
	 */
	private String mavenBuildDir;

        /**
	 * @parameter default-value="${project.basedir}"
         */
        private File mavenPomdir;

        /**
	 * @parameter default-value="olink.xml"
         */
        private String olinkManifest;

	
	public void execute() throws MojoExecutionException {

	    Map options=new HashMap<String, String>();
	    options.put("mavenBuildDir",mavenBuildDir);
	    options.put("olinkManifest",mavenPomdir + "/" + olinkManifest);

		try {
		        System.out.println("pipeline: " + pipeline); 
			FileUtils.extractJaredDirectory("olink",XProcMojo.class,new File(mavenBuildDir + "/docbkx/cloud"));
			engine.run(asURI(pipeline), null, null, options, null);
			System.out.println("Running XProc ..."); }
		catch (Exception e) {
			throw new MojoExecutionException("Error running XProc", e); }
	}
}
