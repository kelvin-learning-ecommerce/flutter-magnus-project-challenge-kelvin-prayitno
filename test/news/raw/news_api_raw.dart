var newsRawResponse = '''
    {
    "status": "ok",
    "totalResults": 13670,
    "articles": [
        {
            "source": {
                "id": "wired",
                "name": "Wired"
            },
            "author": "Joel Khalili",
            "title": "The Trial Over Bitcoin’s True Creator Is in Session",
            "description": "A UK High Court will settle a long-running debate over whether Craig Wright really is Satoshi Nakamoto, inventor of Bitcoin. Monday’s opening arguments laid the groundwork for both sides.",
            "url": "https://www.wired.com/story/craig-wright-bitcoin-satoshi-nakamoto-trial/",
            "urlToImage": "https://media.wired.com/photos/65bd7e2524c06ba3ede91a33/191:100/w_1280,c_limit/Craig-Wright-Trial-Day-1-Business-Yellow-1494808061.jpg",
            "publishedAt": "2024-02-05T21:07:04Z",
            "content": "For eight years, Craig Wright has claimed to be the elusive Bitcoin creator Satoshi Nakamoto. On Monday, in the swelling heat of a UK courtroom, a trial began that will finally settle the question.… [+3163 chars]"
        }
    ]
}
    ''';

var newsEmptyArticleRawResponse = '''
    {
    "status": "ok",
    "totalResults": 0,
    "articles": []
}
    ''';

var newsErrorRaw = '''
{
    "status": "error",
    "code": "parametersMissing",
    "message": "Required parameters are missing, the scope of your search is too broad. Please set any of the following required parameters and try again: q, qInTitle, sources, domains."
}
''';
