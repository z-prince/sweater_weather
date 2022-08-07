require 'rails_helper'

RSpec.describe Location do
  it 'makes location objects from JSON response' do
    loc_data = {
      "info": {
        "statuscode": 0,
        "copyright": {
          "text": '© 2022 MapQuest, Inc.',
          "imageUrl": 'http://api.mqcdn.com/res/mqlogo.gif',
          "imageAltText": '© 2022 MapQuest, Inc.'
        },
        "messages": []
      },
      "options": {
        "maxResults": -1,
        "thumbMaps": true,
        "ignoreLatLngInput": false
      },
      "results": [
        {
          "providedLocation": {
            "location": 'Denver, CO'
          },
          "locations": [
            {
              "street": '',
              "adminArea6": '',
              "adminArea6Type": 'Neighborhood',
              "adminArea5": 'Denver',
              "adminArea5Type": 'City',
              "adminArea4": 'Denver County',
              "adminArea4Type": 'County',
              "adminArea3": 'CO',
              "adminArea3Type": 'State',
              "adminArea1": 'US',
              "adminArea1Type": 'Country',
              "postalCode": '',
              "geocodeQualityCode": 'A5XAX',
              "geocodeQuality": 'CITY',
              "dragPoint": false,
              "sideOfStreet": 'N',
              "linkId": '282041090',
              "unknownInput": '',
              "type": 's',
              "latLng": {
                "lat": 39.738453,
                "lng": -104.984853
              },
              "displayLatLng": {
                "lat": 39.738453,
                "lng": -104.984853
              },
              "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=XtF22GHJdaxdwgRViesyjj4If8sELVf0\n&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-665001028"
            },
            {
              "street": '',
              "adminArea6": '',
              "adminArea6Type": 'Neighborhood',
              "adminArea5": '',
              "adminArea5Type": 'City',
              "adminArea4": 'Denver County',
              "adminArea4Type": 'County',
              "adminArea3": 'CO',
              "adminArea3Type": 'State',
              "adminArea1": 'US',
              "adminArea1Type": 'Country',
              "postalCode": '',
              "geocodeQualityCode": 'A4XAX',
              "geocodeQuality": 'COUNTY',
              "dragPoint": false,
              "sideOfStreet": 'N',
              "linkId": '282932003',
              "unknownInput": '',
              "type": 's',
              "latLng": {
                "lat": 39.738453,
                "lng": -104.984853
              },
              "displayLatLng": {
                "lat": 39.738453,
                "lng": -104.984853
              },
              "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=XtF22GHJdaxdwgRViesyjj4If8sELVf0\n&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-2&scalebar=true&zoom=9&rand=1421174488"
            }
          ]
        }
      ]
    }

    loc = Location.new(loc_data)

    expect(loc).to be_a Location
    expect(loc.lat).to eq(loc_data[:results][0][:locations][0][:latLng][:lat])
    expect(loc.lng).to eq(loc_data[:results][0][:locations][0][:latLng][:lng])
  end
end
