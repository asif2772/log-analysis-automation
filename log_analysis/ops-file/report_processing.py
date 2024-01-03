import datetime
import os
import smtplib
from zipfile import ZipFile
import matplotlib.pyplot as plt
import pandas as pd
import requests
from matplotlib.backends.backend_pdf import PdfPages
now = datetime.datetime.now()
dateinfo = (now - datetime.timedelta(days=1)).strftime('%d%b%y')
reportdt = (now - datetime.timedelta(days=1)).strftime('%d-%b-%Y')
zipname = 'archive_report_' + dateinfo + '.zip'
pdfname = 'MICROSERVICES_REPORT_' + dateinfo + '.pdf'
pdf = PdfPages(pdfname)
files = set()
def generateGPDF(filename, xlabel, ylabel, figtitle, xheader, yheader):
    try:
        csv = pd.read_csv(os.getcwd() + "/processing_data/" + filename,error_bad_lines=False)
        plt.style.use('ggplot')
        plt.figure(figsize=(7, 5.5))
        plt.ticklabel_format(style='plain')
        plt.title(figtitle)
        plt.xlabel(xlabel)
        plt.ylabel(ylabel)

        axis_font = {'size': '8'}
        plt.xticks(rotation=45, **axis_font)
        plt.yticks(rotation=45, **axis_font)
        plt.bar(csv[xheader], csv[yheader], width=.5, color='#0F4472')
        plt.tight_layout()
        pdf.savefig(dpi=500)

        files.add(filename)
    except Exception as ex:
        print(str(ex))
generateGPDF('req_stat_' + dateinfo + '.csv', 'Status', 'Percentage', reportdt + ' Request Status', 'STATUS', 'PERCENTAGE')
generateGPDF('ms_hit_count_' + dateinfo + '.csv', 'Service List', 'Hit Count', reportdt + ': Service-Wise Hits', 'MicroService', 'Count')
pdf.close()
with ZipFile("/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis/archive-data/" + zipname, 'w') as zip:
    for file in files:
        zip.write("/home/bs960/imranMadbar/myPROJECT/log-analysis-automation/log_analysis/processing_data/" + file)
