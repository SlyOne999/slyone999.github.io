# NTLM

## Description

### Responder

`[SMB] NTLMv1 Hash` and `[SMB] NTLMv1-SSP Hash` capture structure:

```
<Username>:<Domain>:<LMv1_Response>:<NTv1_Response>:<Server_Challenge>
```

`[SMB] NTLMv2-SSP Hash` capture structure:

```
<Username>:<Domain>:<Server_Challenge>:<LMv2_Response>:<NTv2_Response>
```

* [github.com/lgandx/Responder/blob/eb449bb061a8eb3944b96b157de73dea444ec46b/servers/SMB.py#L149](https://github.com/lgandx/Responder/blob/eb449bb061a8eb3944b96b157de73dea444ec46b/servers/SMB.py#L149)
* [ru.wikipedia.org/wiki/NTLMv2#NTLMv2](https://ru.wikipedia.org/wiki/NTLMv2#NTLMv2)
* [www.ivoidwarranties.tech/posts/pentesting-tuts/responder/cheatsheet/](https://www.ivoidwarranties.tech/posts/pentesting-tuts/responder/cheatsheet/)
* Andrei Miroshnikov. Windows Security Monitoring: Scenarios and Patterns, Part III, pp. 330-333.

