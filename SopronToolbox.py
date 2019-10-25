import cdstoolbox as ct

@ct.application(title='Retrieve Data')
@ct.output.dataarray()
def retrieve_sample_data():
    """
    Application main steps:

    - retrieve a variable from CDS Catalogue
    - produce a link to download it.
    """

    data = ct.catalogue.retrieve(
    'reanalysis-era5-land-monthly-means',
    {
        'product_type':'monthly_averaged_reanalysis',
        'variable':'2m_temperature',
        'year':[
            '2001','2002','2003',
            '2004','2005','2006',
            '2007','2008','2009',
            '2010','2011','2012',
            '2013','2014','2015',
            '2016','2017','2018',
            '2019'
        ],
        'month':[
            '01','02','03',
            '04','05','06',
            '07','08','09',
            '10','11','12'
        ],
        'time':'00:00',
        'format':'netcdf',
        'area': ['47.4', '16.4', '47.6', '16.6' ] # swlat swlon neat nelon
    })
    return data
