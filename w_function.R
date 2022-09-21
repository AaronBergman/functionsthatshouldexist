#' How many hours, years, or centuries have you spent
#'  meticulously writing out
#'  "write_csv(whatever, 'whatever.csv')"
#'  perhaps followed by "view(whatever)"?
#'  No more.
#'
#' Arguments:
#' 1. df = the dataframe you want to write as a csv to your working directory. Defaults to NULL
#' 2. v (for "view") defaults to FALSE, but make it T to have the df automatically show up in the viewer after writing
#' 3. There is no 3, because I don't really know what I'm doing
#'
#' Example:
#'
#' GOATS = tibble(name=c("Juice","Olivia","Mac","Billie"), alive=c(F, T, F, T))
#'
#' w(GOATS) # new CSV just dropped
#'
#' w(GOATS,T) #same but now you see it too
#'
#' GOATS%>%w(t) #This way doesn't work but idk why  ¯\(ツ)_/¯
#'
#' Thanks to the following website for enabling this monstrosity:
#'
#' https://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/

w=function(df=NULL,view=F){
  if(is.data.frame(df)) {
  name_of_df=substitute(df)
  local_copy=get(as.character(name_of_df),envir = globalenv())
  write_csv(local_copy,paste(name_of_df,'.csv',sep=''))
  view(local_copy,title=name_of_df) }
  else {cat("Not a data frame")}
}


