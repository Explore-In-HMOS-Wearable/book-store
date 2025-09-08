import { rcp } from '@kit.RemoteCommunicationKit';
import { BASE_URL } from './Constants';


function sessionConfig(): rcp.SessionConfiguration {
  return {
    baseAddress: BASE_URL
  }
}

export function getHttp(url: string) {
  const session = rcp.createSession(sessionConfig());
  return session.get(`${url}`).then((res) => res.toJSON()).finally(() => {
    session.close();
  });
}
