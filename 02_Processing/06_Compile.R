project_dir <- here::here()
codefile <- paste(project_dir, '02_Processing', '05_Report.R', sep = "/")
outfile <- paste(project_dir, "03_Output", "Precipitation Report.html", sep = "/")

rmarkdown::render(input = codefile,output_file=outfile)
