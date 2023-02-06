file_directory<-list("project_dir" = here::here(), 
                    "codefile" =  paste(here::here(),'02_Processing', '07_Report.R', sep = "/"),
                    "outfile" = paste(here::here(), "03_Output", "Precipitation Report.html", sep = "/"))
                    

rmarkdown::render(input = file_directory$codefile,
                  output_file = file_directory$outfile)
