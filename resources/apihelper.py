import requests


def send_post_request(endpoint, payload, expected_status_code):

    headers = {
        "accept": "application/json",
        "Content-Type": "application/json"
    }

    try:

        response = requests.post(f"https://landmark.taqtics.co/v1/external{endpoint}", json=payload,headers=headers)


        actual_status_code = response.status_code


        if actual_status_code == expected_status_code:

            response_data = response.json()


            if "token" in response_data:
                return {"status": "Successful", "token": response_data["token"]}

            elif "message" in response_data:
                return {"status": "Message", "message": response_data["message"]}

            elif "error" in response_data:
                return {"status": "Error", "error": response_data["error"]}

            else:
                return {"status": "Failed", "message": "No relevant key found in response."}
        else:
            return {"status": "Failed", "message": f"Unexpected status code: {actual_status_code}"}

    except requests.exceptions.RequestException as e:
        return {"status": "Error", "message": str(e)}
